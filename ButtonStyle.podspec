Pod::Spec.new do |spec|
spec.name         = "ButtonStyle"
spec.version      = "1.0.0"
spec.summary      = "A suite of pre-built, customizable SwiftUI ButtonStyle streamline UI development and enhance user interactions."
spec.description  = <<-DESC
This SDK provides a comprehensive collection of button styles—such as capsule, shape, bouncy, growing, and loading buttons—that leverage SwiftUI's ButtonStyle protocol to ensure consistent, modern aesthetics and responsive feedback. Each style comes with configurable parameters, allowing developers to easily tailor colors, shapes, padding, and animations to match their design needs without writing extensive boilerplate code. By centralizing complex styling logic into reusable components, the SDK not only accelerates development but also promotes maintainability and a cohesive user experience across applications.
DESC

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

spec.platforms = {
  :ios     => "15.0",
  :osx     => "12.0",
  :watchos => "8.0"
}

spec.source       = { :git => "https://github.com/Enryun/ButtonStyle.git", :tag => "#{spec.version}" }

spec.module_name = 'ButtonStyle'
spec.source_files  = 'Sources/**/*.{swift}'
spec.exclude_files = "Classes/Exclude"

spec.swift_versions = '6.0'

end
