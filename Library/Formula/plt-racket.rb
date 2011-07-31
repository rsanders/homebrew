require 'formula'

class PltRacket < Formula
  # Use GitHub; tarball doesn't have everything needed for building on OS X
  url 'https://github.com/plt/racket.git', :tag => 'v5.1.1'
  homepage 'http://racket-lang.org/'
  version '5.1.1'

  # Don't strip symbols; need them for dynamic linking.
  skip_clean 'bin'

  # depends_on 'cairo'

  fails_with_llvm "Fails with llvm"

  def install
    ENV.gcc_4_2
    Dir.chdir 'src' do
      args = ["--disable-debug", "--disable-dependency-tracking",
              "--disable-places", "--disable-futures", # temporary, to force it to build on Mac OS X Lion DP3
              # "--enable-xonx",
              "--disable-gracket",
              "--enable-shared",
              "--prefix=#{prefix}" ]

      if MacOS.prefer_64_bit?
        args += ["--enable-mac64", "--enable-sgc", "--disable-gracket"]
      end

      system "./configure", *args
      system "make"
      ohai   "Installing might take a long time (~40 minutes)"
      system "make install"
    end
  end
end
