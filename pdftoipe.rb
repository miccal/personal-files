class Pdftoipe < Formula
  desc "Drawing editor for creating figures in PDF"
  homepage "https://github.com/otfried/ipe-tools"
  head "https://github.com/otfried/ipe-tools.git"

  depends_on "pkg-config" => :build
  depends_on "poppler"

  def install
    cd "pdftoipe" do
      system "make"
      bin.install "pdftoipe"
      man1.install "pdftoipe.1"
    end
  end
end
