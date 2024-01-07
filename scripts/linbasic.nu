export def setup-helix [ pkg: string ] {
    run-external sudo $pkg install helix
}
