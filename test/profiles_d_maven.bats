#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
  source "${BATS_TEST_DIRNAME}/../profile.d/maven"
}

@test "[profile_d_maven] Check if the recursive maven clean function is present" {
  [[ "$(type -t recursive-maven-clean)" == "function" ]]
}

@test "[profile_d_maven] Check if the rmc alias is available and set properly" {
  run alias rmc
  [ "$output" = "alias rmc='recursive-maven-clean'" ]
}
