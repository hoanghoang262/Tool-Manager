-- AlterTable
ALTER TABLE "Course" ALTER COLUMN "learningCategoryID" DROP NOT NULL,
ALTER COLUMN "startDate" DROP NOT NULL,
ALTER COLUMN "endDate" DROP NOT NULL,
ALTER COLUMN "totalHours" DROP NOT NULL;
