target("test")
    set_kind("binary")
    add_files("*.asm")
    set_toolchains("nasm")