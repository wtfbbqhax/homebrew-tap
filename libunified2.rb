class Libunified2 < Formula
    homepage "https://github.com/wtfbbqhax/libunified2"
    url "https://github.com/wtfbbqhax/libunified2/releases/download/v0.0.7/libunified2-0.0.7.tar.gz"
    sha256 "ebda027d9502d71d3b1e5627bac171362338d91e548b516be88a77fd2a114a3e"
    revision 1

    def install
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
    end

    test do
        (testpath/"test.c").write <<-EOS.undent
        #include <unified2.h>

        int main(void)
        {
            Unified2 *unified2;
            Unified2 *entry;

            unified2 = Unified2New();
            entry = Unified2EntryNew();

            if ( !unified2 || !entry )
                return 1;

            Unified2Free(unified2);
            free(entry);

            return 0;
        }
        EOS

        system ENV.cc, "test.c", "-lunified2", "-o", "test"
        system "./test"
    end
end
