#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
}

@test "Registering a single alias" {
  register_alias "ll" "ls -al"
  [[ "${REGISTERED_ALIASES[@]}" == "ll" ]]
}

@test "Registering multiple aliases" {
  register_alias "ls" "ls --color" && register_alias "ll" "ls -al"
  [[ "${REGISTERED_ALIASES[@]}" == "ls ll" ]]
}

@test "Unregistering a single alias registered by the system" {
  alias my_awesome_alias=my_awesome_command
  register_alias "ls" "ls --color" && register_alias "ll" "ll -al"
  unregister_alias "ll"
  [[ ! `alias ll` ]]
  alias my_awesome_alias
  [[ "${REGISTERED_ALIASES[@]}" == "ls" ]]
}

@test "Unregistering a single alias registered outside the system does nothing" {
  alias my_awesome_alias=my_awesome_command
  unregister_alias "my_awesome_alias"
  alias my_awesome_alias
}

@test "Unregistering all aliases registered by the system" {
  alias my_awesome_alias=my_awesome_command
  register_alias "ll" "ls -al"
  unregister_aliases
  [[ ! `alias ll` ]]
  alias my_awesome_alias
  [[ "${REGISTERED_ALIASES[@]}" == "" ]]
}
