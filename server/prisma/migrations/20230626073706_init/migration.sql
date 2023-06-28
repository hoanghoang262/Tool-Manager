/*
  Warnings:

  - Added the required column `starStarID` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `postPostID` to the `Star` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "starStarID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Star" ADD COLUMN     "postPostID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_postPostID_fkey" FOREIGN KEY ("postPostID") REFERENCES "Post"("postID") ON DELETE RESTRICT ON UPDATE CASCADE;
