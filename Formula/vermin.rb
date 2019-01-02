class Vermin < Formula
  include Language::Python::Virtualenv

  desc "Concurrently detect the minimum Python versions needed to run code"
  homepage "https://github.com/netromdk/vermin"
  url "https://github.com/netromdk/vermin/archive/v0.4.10.tar.gz"
  sha256 "2b653a9440257867144bdec24ffa3493ac45c8f8ea4dabe4e5441991817b1f77"
  head "https://github.com/netromdk/vermin.git"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"vermin", "--help"
  end
end
