require 'formula'

class Stklos < Formula
  url 'http://www.stklos.net/download/stklos-1.01.tar.gz'
  homepage 'http://www.stklos.net/'
  md5 '2c370627c3abd07c30949b2ee7d3d987'

  depends_on 'gmp'
  depends_on 'pcre'

  fails_with_llvm "Fails with LLVM"

  def install
    ENV.gcc_4_2
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
