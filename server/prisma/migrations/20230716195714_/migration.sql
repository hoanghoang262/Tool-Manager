/*
  Warnings:

  - You are about to drop the column `qAPostID` on the `LearningCategory` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "LearningCategory" DROP CONSTRAINT "LearningCategory_qAPostID_fkey";

-- AlterTable
ALTER TABLE "LearningCategory" DROP COLUMN "qAPostID";

-- CreateTable
CREATE TABLE "_LearningCategoryToQAPost" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_LearningCategoryToQAPost_AB_unique" ON "_LearningCategoryToQAPost"("A", "B");

-- CreateIndex
CREATE INDEX "_LearningCategoryToQAPost_B_index" ON "_LearningCategoryToQAPost"("B");

-- AddForeignKey
ALTER TABLE "_LearningCategoryToQAPost" ADD CONSTRAINT "_LearningCategoryToQAPost_A_fkey" FOREIGN KEY ("A") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LearningCategoryToQAPost" ADD CONSTRAINT "_LearningCategoryToQAPost_B_fkey" FOREIGN KEY ("B") REFERENCES "QAPost"("qapostID") ON DELETE CASCADE ON UPDATE CASCADE;
