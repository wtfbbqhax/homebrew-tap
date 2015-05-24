class Libunified2 < Formula
    homepage "https://github.com/wtfbbqhax/libunified2"
    url "https://github.com/wtfbbqhax/libunified2/releases/download/v0.0.7/libunified2-0.0.7.tar.gz"
    sha256 "95c7ff3d15973abfdf744c252ad2f3d984792c28f9f46e89e90a91a0dd672f0a"
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
