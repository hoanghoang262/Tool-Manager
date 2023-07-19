/*
  Warnings:

  - You are about to drop the column `classStructureClassStructureID` on the `Class` table. All the data in the column will be lost.
  - You are about to drop the column `qAPostQapostID` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `qAPostQapostID` on the `Image` table. All the data in the column will be lost.
  - You are about to drop the column `qAPostQapostID` on the `Video` table. All the data in the column will be lost.
  - Added the required column `classStructureID` to the `Class` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_qAPostQapostID_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_qAPostQapostID_fkey";

-- DropForeignKey
ALTER TABLE "Video" DROP CONSTRAINT "Video_qAPostQapostID_fkey";

-- AlterTable
ALTER TABLE "Class" DROP COLUMN "classStructureClassStructureID",
ADD COLUMN     "classStructureID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "qAPostQapostID",
ADD COLUMN     "qAPostID" TEXT;

-- AlterTable
ALTER TABLE "Image" DROP COLUMN "qAPostQapostID",
ADD COLUMN     "qAPostID" TEXT;

-- AlterTable
ALTER TABLE "Video" DROP COLUMN "qAPostQapostID",
ADD COLUMN     "qAPostID" TEXT;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_qAPostID_fkey" FOREIGN KEY ("qAPostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_qAPostID_fkey" FOREIGN KEY ("qAPostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_qAPostID_fkey" FOREIGN KEY ("qAPostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;
