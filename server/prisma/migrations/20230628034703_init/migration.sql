/*
  Warnings:

  - A unique constraint covering the columns `[postID]` on the table `PostStructure` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `classStructureClassStructureID` to the `Class` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Class" ADD COLUMN     "classStructureClassStructureID" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "ClassStructure" (
    "classStructureID" TEXT NOT NULL,
    "classClassID" TEXT NOT NULL,

    CONSTRAINT "ClassStructure_pkey" PRIMARY KEY ("classStructureID")
);

-- CreateTable
CREATE TABLE "CourseStructure" (
    "courseStructureID" TEXT NOT NULL,
    "courseCourseID" TEXT NOT NULL,

    CONSTRAINT "CourseStructure_pkey" PRIMARY KEY ("courseStructureID")
);

-- CreateIndex
CREATE UNIQUE INDEX "ClassStructure_classClassID_key" ON "ClassStructure"("classClassID");

-- CreateIndex
CREATE UNIQUE INDEX "CourseStructure_courseCourseID_key" ON "CourseStructure"("courseCourseID");

-- CreateIndex
CREATE UNIQUE INDEX "PostStructure_postID_key" ON "PostStructure"("postID");

-- AddForeignKey
ALTER TABLE "ClassStructure" ADD CONSTRAINT "ClassStructure_classClassID_fkey" FOREIGN KEY ("classClassID") REFERENCES "Class"("classID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CourseStructure" ADD CONSTRAINT "CourseStructure_courseCourseID_fkey" FOREIGN KEY ("courseCourseID") REFERENCES "Course"("courseID") ON DELETE RESTRICT ON UPDATE CASCADE;
