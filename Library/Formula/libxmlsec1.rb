require 'formula'

class Libxmlsec1 < Formula
  url 'http://www.aleksey.com/xmlsec/download/xmlsec1-1.2.18.tar.gz'
  homepage 'http://www.aleksey.com/xmlsec/'
  md5 '8694b4609aab647186607f79e1da7f1a'
  
  depends_on "libxml2"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
