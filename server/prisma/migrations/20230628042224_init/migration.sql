/*
  Warnings:

  - A unique constraint covering the columns `[learningCategoryName]` on the table `LearningCategory` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `like` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "QAStatus" AS ENUM ('pending', 'finish');

-- CreateEnum
CREATE TYPE "QAType" AS ENUM ('error', 'ask');

-- AlterTable
ALTER TABLE "ClassStructure" ADD COLUMN     "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Comment" ADD COLUMN     "like" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "qAPostQapostID" TEXT;

-- AlterTable
ALTER TABLE "CourseStructure" ADD COLUMN     "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "DocumentStructure" ADD COLUMN     "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Image" ADD COLUMN     "qAPostQapostID" TEXT;

-- AlterTable
ALTER TABLE "LearningCategory" ADD COLUMN     "qAPostQapostID" TEXT;

-- AlterTable
ALTER TABLE "PostStructure" ADD COLUMN     "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Video" ADD COLUMN     "qAPostQapostID" TEXT;

-- CreateTable
CREATE TABLE "QAPost" (
    "qapostID" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "QAType" "QAType" NOT NULL DEFAULT 'ask',
    "status" "QAStatus" NOT NULL DEFAULT 'pending',
    "userInfoID" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "QAPost_pkey" PRIMARY KEY ("qapostID")
);

-- CreateIndex
CREATE UNIQUE INDEX "LearningCategory_learningCategoryName_key" ON "LearningCategory"("learningCategoryName");

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_qAPostQapostID_fkey" FOREIGN KEY ("qAPostQapostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_qAPostQapostID_fkey" FOREIGN KEY ("qAPostQapostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LearningCategory" ADD CONSTRAINT "LearningCategory_qAPostQapostID_fkey" FOREIGN KEY ("qAPostQapostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_qAPostQapostID_fkey" FOREIGN KEY ("qAPostQapostID") REFERENCES "QAPost"("qapostID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QAPost" ADD CONSTRAINT "QAPost_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userID") ON DELETE SET NULL ON UPDATE CASCADE;
