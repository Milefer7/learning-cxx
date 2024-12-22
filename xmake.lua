add_rules("mode.debug", "mode.release")
set_encodings("utf-8")
set_warnings("all")
set_languages("cxx17")

-- 确保全局编译和链接选项添加了 -pthread
add_cxxflags("-pthread")  -- 编译时加上 -pthread
add_ldflags("-pthread")   -- 链接时加上 -pthread

target("test")
    set_kind("static")
    add_defines(string.format("__XMAKE__=\"%s\"", os.scriptdir():gsub("\\", "/")))
    add_files("learn/test.cpp")

target("learn")
    set_kind("binary")
    add_deps("test")
    add_files("learn/learn.cpp")

target("summary")
    set_kind("binary")
    add_deps("test")
    add_files("learn/summary.cpp")
