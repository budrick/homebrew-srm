class Srm < Formula
  desc "Command-line program to delete files securely"
  homepage "https://srm.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/srm/1.2.15/srm-1.2.15.tar.gz"
  sha256 "7583c1120e911e292f22b4a1d949b32c23518038afd966d527dae87c61565283"

  keg_only :provided_by_osx if MacOS.version < :sierra

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    touch "srm_test"
    system bin/"srm", "srm_test"
    !File.exist? "srm_test"
  end
end
