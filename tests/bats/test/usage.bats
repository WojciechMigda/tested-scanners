bats_require_minimum_version 1.5.0

setup_file() {
    # load() in setup_file does not work
    #load 'test_helper/bats-support/load'
    #load 'test_helper/bats-assert/load'
    echo
}

#teardown_file() {
#    echo
#}

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

#teardown() {
#    echo
#}

masscan() {
    docker exec workbench /masscan/bin/masscan $@
}

@test "Usage is shown when run without arguments" {
    run -1 masscan

    assert_output --partial "usage:"
}

@test "Usage shows '--ipv6-allow-link-local' help entry" {
    run -1 masscan

    assert_output --partial "--ipv6-allow-link-local:"
}

@test "Usage shows '--with-lan-arp' help entry" {
    run -1 masscan

    assert_output --partial "--with-lan-arp:"
}

@test "Usage shows '--lan-arp-fast-fail' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-fast-fail:"
}

@test "Usage shows '--lan-arp-retries' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-retries UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan:"
}

@test "Usage shows '--lan-arp-shotgun-scan-wait' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-wait UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan-repeats' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-repeats UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan-rate' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-rate REAL:"
}

@test "Usage shows '--snmp-v1' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v1:"
}

@test "Usage shows '--snmp-v2c' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v2c:"
}

@test "Usage shows '--snmp-v3' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v3:"
}

@test "Usage shows '--snmp-comm' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-comm <community>:"
}