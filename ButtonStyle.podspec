Pod::Spec.new do |spec|
  spec.name         = "ButtonStyle"
  spec.version      = "1.0.0"
  spec.summary      = "A short description of ButtonStyle."

  
  spec.homepage     = "https://github.com/Enryun/ButtonStyle"

  spec.license      = { :type => "MIT", :text => 'MIT License
MIT License

Copyright (c) 2025 James Thang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.' }

 spec.author             = { "JamesThang" => "jamesthang1996@gmail.com" }
 spec.social_media_url   = "https://www.linkedin.com/in/jamesthang/"

 spec.platform     = :ios
 spec.platform     = :ios, "15.0"

  spec.source       = { :git => "https://github.com/Enryun/ButtonStyle.git", :tag => "#{spec.version}" }

  spec.module_name = 'ButtonStyle'
  spec.source_files  = 'Sources/**/*.{swift}'
  spec.exclude_files = "Classes/Exclude"
 
  spec.swift_versions = '6.0'
  
end
