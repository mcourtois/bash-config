#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
  source "${BATS_TEST_DIRNAME}/../profile.d/docker"
}

@test "[profile_d_docker] Check if the Docker clean all function exists" {
  [[ "$(type -t docker-clean-all)" == "function" ]]
}

@test "[profile_d_docker] Check if the Docker clean volumes function exists" {
  [[ "$(type -t docker-clean-volumes)" == "function" ]]
}

@test "[profile_d_docker] Check if the Docker clean containers function exists" {
  [[ "$(type -t docker-clean-containers)" == "function" ]]
}

@test "[profile_d_docker] Check if the Docker shell function exists" {
  [[ "$(type -t docker-shell)" == "function" ]]
}

@test "[profile_d_docker] Check if the Docker Moby attach screen is present (OSX Beta)" {
  run alias docker-moby
  [[ "$output" =~ ^"alias docker-moby='screen -D -R -S moby "* ]]
}
