/*
  Warnings:

  - Added the required column `readCount` to the `Document` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Document" ADD COLUMN     "readCount" DECIMAL(65,30) NOT NULL;

-- AlterTable
ALTER TABLE "Star" ADD COLUMN     "classID" TEXT,
ADD COLUMN     "courseID" TEXT,
ADD COLUMN     "documentID" TEXT;

-- CreateTable
CREATE TABLE "Image" (
    "imageID" TEXT NOT NULL,
    "postID" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("imageID")
);

-- CreateTable
CREATE TABLE "Video" (
    "videoID" TEXT NOT NULL,
    "postID" TEXT NOT NULL,
    "video_url" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Video_pkey" PRIMARY KEY ("videoID")
);

-- CreateTable
CREATE TABLE "PostStructure" (
    "postStructureID" TEXT NOT NULL,

    CONSTRAINT "PostStructure_pkey" PRIMARY KEY ("postStructureID")
);

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_postID_fkey" FOREIGN KEY ("postID") REFERENCES "Post"("postID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_postID_fkey" FOREIGN KEY ("postID") REFERENCES "Post"("postID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_documentID_fkey" FOREIGN KEY ("documentID") REFERENCES "Document"("documentID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_classID_fkey" FOREIGN KEY ("classID") REFERENCES "Class"("classID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_courseID_fkey" FOREIGN KEY ("courseID") REFERENCES "Course"("courseID") ON DELETE SET NULL ON UPDATE CASCADE;
