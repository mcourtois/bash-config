#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
  source "${BATS_TEST_DIRNAME}/../profile.d/ssh"
}

@test "[profile_d_ssh] Check if the config generation function is available" {
  [[ "$(type -t ssh-generate-config)" == "function" ]]
}

@test "[profile_d_ssh] Check if the ssh alias is available and set properly" {
  run alias ssh
  [ "$output" = "alias ssh='ssh-generate-config && ssh'" ]
}

@test "[profile_d_ssh] Check if the configuration generation works" {
	local _config_d=$BATS_TMPDIR/ssh/config.d
	local _config=$BATS_TMPDIR/ssh/config
	mkdir -p $_config_d
  echo "Base" > $_config_d/base
  echo -e "First entry first line\nFirse entry second line" > $_config_d/00-first
  echo "Second entry" > $_config_d/01-second
  mkdir -p $_config_d/sub
  echo "Sub-dir entry" > $_config_d/sub/00-asdf
  ssh-generate-config $_config_d $_config
	[[ "$(cat $_config | wc -l | tr -d '[[:space:]]')" == "8" ]]
}
