/*
  Warnings:

  - You are about to drop the column `qAPostQapostID` on the `LearningCategory` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "LearningCategory" DROP CONSTRAINT "LearningCategory_qAPostQapostID_fkey";

-- AlterTable
ALTER TABLE "LearningCategory" DROP COLUMN "qAPostQapostID",
ADD COLUMN     "qAPostID" TEXT;

-- AddForeignKey
ALTER TABLE "LearningCategory" ADD CONSTRAINT "LearningCategory_qAPostID_fkey" FOREIGN KEY ("qAPostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;
