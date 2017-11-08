class Doitlive < Formula
  desc "Replay stored shell commands for live presentations"
  homepage "https://doitlive.readthedocs.io/en/latest/"
  url "https://files.pythonhosted.org/packages/b1/5d/4a5784409ff94900898ff671df2a32bf19469114eb8006286fda3fc7e8d5/doitlive-3.0.3.tar.gz"
  sha256 "d219d4d198acd74fab066e466b2c402a491afdddbeeb40d51b2b9781143321a6"

  bottle do
    cellar :any_skip_relocation
    sha256 "64f444a22662a3155ba8f5a57dfc904459021fcbeab0d4aaa75a0403ad98d619" => :high_sierra
    sha256 "64f444a22662a3155ba8f5a57dfc904459021fcbeab0d4aaa75a0403ad98d619" => :sierra
    sha256 "d27c4d742b6a7b0556743eaa388446d660436bccc21bd143c3c1e6ef632338c3" => :el_capitan
  end

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{libexec}"

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/doitlive", "themes", "--preview"
  end
end
