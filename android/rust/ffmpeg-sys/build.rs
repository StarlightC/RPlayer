// Copyright (c) 2023 StarlightC <mail.starlightc@gmail.com>
//
// This file is part of RPlayer.
//
// RPlayer is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// RPlayer is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with RPlayer; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
extern crate bindgen;

use std::fs;
use std::env;
use std::vec;
use std::path::PathBuf;

fn main() {
    let modules = &vec!["avcodec","avfilter","avformat","avutil","swresample","swscale"];
    let rel_path = PathBuf::from(env::var("TARGET_ARC_PATH").unwrap()); // e.g. ./cpp/lib/x86
    let abs_path = fs::canonicalize(&rel_path).unwrap().into_os_string().into_string().unwrap();
    println!("cargo:rustc-link-search={}",abs_path);
    for module in modules {
        println!("cargo:rustc-link-lib={}",module);
    }
    let bindings = bindgen::Builder::default()
        .header("./cpp/include/wrapper.h")
        .allowlist_recursively(false)
        .generate_comments(false)       // Skip doc generation
        .blocklist_type("max_align_t")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
        .clang_args(["-I","./cpp/include"])
        .generate()
        .expect("Unable to generate bindings");
        // Write the bindings to the $OUT_DIR/bindings.rs file.
    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
        bindings
            .write_to_file(out_path.join("ffmpeg_sys.rs"))
            .expect("Couldn't write bindings!");
}
