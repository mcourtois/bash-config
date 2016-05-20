#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
  source "${BATS_TEST_DIRNAME}/../profile.d/git"
}

@test "[profile_d_git] Check if the git recursive pull function is present" {
  [[ "$(type -t recursive-git-pull)" == "function" ]]
}

@test "[profile_d_git] Check if the rgp alias is available and set properly" {
  run alias rgp
  [ "$output" = "alias rgp='recursive-git-pull'" ]
}
