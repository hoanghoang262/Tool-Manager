-- DropForeignKey
ALTER TABLE "Class" DROP CONSTRAINT "Class_learningCategoryID_fkey";

-- DropForeignKey
ALTER TABLE "Course" DROP CONSTRAINT "Course_learningCategoryID_fkey";

-- CreateTable
CREATE TABLE "DocumentStructure" (
    "documentStructureID" TEXT NOT NULL,
    "documentID" TEXT NOT NULL,

    CONSTRAINT "DocumentStructure_pkey" PRIMARY KEY ("documentStructureID")
);

-- CreateTable
CREATE TABLE "_LearningCategoryToPost" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ClassToLearningCategory" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CourseToLearningCategory" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_DocumentToLearningCategory" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "DocumentStructure_documentID_key" ON "DocumentStructure"("documentID");

-- CreateIndex
CREATE UNIQUE INDEX "_LearningCategoryToPost_AB_unique" ON "_LearningCategoryToPost"("A", "B");

-- CreateIndex
CREATE INDEX "_LearningCategoryToPost_B_index" ON "_LearningCategoryToPost"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClassToLearningCategory_AB_unique" ON "_ClassToLearningCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassToLearningCategory_B_index" ON "_ClassToLearningCategory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CourseToLearningCategory_AB_unique" ON "_CourseToLearningCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_CourseToLearningCategory_B_index" ON "_CourseToLearningCategory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DocumentToLearningCategory_AB_unique" ON "_DocumentToLearningCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_DocumentToLearningCategory_B_index" ON "_DocumentToLearningCategory"("B");

-- AddForeignKey
ALTER TABLE "DocumentStructure" ADD CONSTRAINT "DocumentStructure_documentID_fkey" FOREIGN KEY ("documentID") REFERENCES "Document"("documentID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LearningCategoryToPost" ADD CONSTRAINT "_LearningCategoryToPost_A_fkey" FOREIGN KEY ("A") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LearningCategoryToPost" ADD CONSTRAINT "_LearningCategoryToPost_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("postID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToLearningCategory" ADD CONSTRAINT "_ClassToLearningCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Class"("classID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToLearningCategory" ADD CONSTRAINT "_ClassToLearningCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseToLearningCategory" ADD CONSTRAINT "_CourseToLearningCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Course"("courseID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseToLearningCategory" ADD CONSTRAINT "_CourseToLearningCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DocumentToLearningCategory" ADD CONSTRAINT "_DocumentToLearningCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Document"("documentID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DocumentToLearningCategory" ADD CONSTRAINT "_DocumentToLearningCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE CASCADE ON UPDATE CASCADE;
