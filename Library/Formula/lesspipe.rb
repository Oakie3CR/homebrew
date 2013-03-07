require 'formula'

class Lesspipe < Formula
  homepage 'http://www-zeuthen.desy.de/~friebel/unix/lesspipe.html'
  url 'http://sourceforge.net/projects/lesspipe/files/lesspipe/1.82/lesspipe-1.82.tar.gz'
  sha1 '61a7657b20b910ed8219c6b77467e601f9a89894'

  def install
    system "./configure", "--prefix=#{prefix}", "--fixed"
    man1.mkpath
    system "make install"
  end
  
  def caveats
    <<-EOS.undent
      To activate lesspipe.sh the environment variable LESSOPEN has to be defined
      in the following way:

        LESSOPEN="|lesspipe.sh %s"; export LESSOPEN    (sh like shells)
        setenv LESSOPEN "|lesspipe.sh %s"              (csh, tcsh)
    EOS
  end
end
