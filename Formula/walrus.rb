class Walrus < Formula
  include Language::Python::Virtualenv

  desc "Backport compiler for Python 3.8 assignment expressions"
  homepage "https://github.com/pybpc/walrus#walrus"
  url "https://github.com/pybpc/walrus/archive/v0.1.4.tar.gz"
  sha256 "9c568b24f33f38bad9625ca38f8d1cd3cef479e07951b4f071d30dafd967c0ae"

  head "https://github.com/pybpc/walrus.git", :branch => "master"

  depends_on "python@3.8"

  resource "parso" do
    url "https://files.pythonhosted.org/packages/e0/a2/3786c568fc8e9f64b9f7143e4c3904e61a8c5cb17260f22a6a3019d80c02/parso-0.5.2.tar.gz"
    sha256 "55cf25df1a35fd88b878715874d2c4dc1ad3f0eebd1e0266a67e1f55efccfbe1"
  end

  resource "tbtrim" do
    url "https://files.pythonhosted.org/packages/85/62/89756f5d2d61691591c4293fd4cc1fbb3aab1466251c7319fe60dd08fb27/tbtrim-0.3.1.tar.gz"
    sha256 "b6285ac02e9a7b78fab97de65668fe2def0f5d8783b0e0dfcb4b7c0a635b3d11"
  end

  def install
    virtualenv_install_with_resources

    man1.install "share/walrus.1"
    bash_completion.install "share/walrus.bash-completion"
  end

  test do
    (testpath/"test.py").write <<~EOS
      a = (b := 1)
      print(a, b)
    EOS

    std_output = <<~EOS
      1 1
    EOS

    system bin/"walrus", "--no-archive", "test.py"
    assert_match std_output, shell_output("#{Formula["python3"].bin}/python test.py")
  end
end
