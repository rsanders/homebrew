require 'formula'

class Abcl < Formula
  url 'http://common-lisp.net/project/armedbear/releases/0.26.1/abcl-bin-0.26.1.tar.gz'
  homepage 'http://common-lisp.net/project/armedbear/'
  md5 'b8cfbfa4536b30c334f84d3fc5395e7d'

  depends_on 'rlwrap'

  def install
    prefix.install "abcl.jar"
    prefix.install "abcl-contrib.jar"
    (bin+"abcl").write <<-EOS.undent
    #!/bin/sh
    rlwrap java -jar #{prefix}/abcl.jar "$@"
    EOS
  end
end
