/*
  Warnings:

  - You are about to drop the column `starStarID` on the `Post` table. All the data in the column will be lost.
  - Added the required column `postID` to the `PostStructure` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Image" ADD COLUMN     "documentDocumentID" TEXT;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "starStarID";

-- AlterTable
ALTER TABLE "PostStructure" ADD COLUMN     "postID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Video" ADD COLUMN     "documentDocumentID" TEXT;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_documentDocumentID_fkey" FOREIGN KEY ("documentDocumentID") REFERENCES "Document"("documentID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_documentDocumentID_fkey" FOREIGN KEY ("documentDocumentID") REFERENCES "Document"("documentID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostStructure" ADD CONSTRAINT "PostStructure_postID_fkey" FOREIGN KEY ("postID") REFERENCES "Post"("postID") ON DELETE RESTRICT ON UPDATE CASCADE;
