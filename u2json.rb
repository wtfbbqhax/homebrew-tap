require "formula"

class U2json < Formula
  homepage "https://github.com/wtfbbqhax/u2json"
  url "https://github.com/wtfbbqhax/u2json/releases/download/v1.0/u2json-1.tar.gz"
  sha256 "36eb6807e7dda88ae232a41f2c323c29f896c810c5cb0020e0415629e62cdba0"

  depends_on "libunified2"
  depends_on "jansson"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
