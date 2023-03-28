-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Task" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "teacher" TEXT,
    "class" TEXT,
    "requirement" TEXT NOT NULL,
    "price" INTEGER NOT NULL DEFAULT 0,
    "deposit" INTEGER NOT NULL DEFAULT 0,
    "payed" INTEGER NOT NULL DEFAULT 0,
    "facebook" TEXT,
    "zalo" TEXT,
    "phone" TEXT,
    "note" TEXT NOT NULL DEFAULT '',
    "startAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Deadline" DATETIME,
    "userId" TEXT,
    CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Task" ("Deadline", "class", "deposit", "facebook", "id", "name", "note", "payed", "phone", "price", "requirement", "startAt", "subject", "teacher", "zalo") SELECT "Deadline", "class", "deposit", "facebook", "id", "name", "note", "payed", "phone", "price", "requirement", "startAt", "subject", "teacher", "zalo" FROM "Task";
DROP TABLE "Task";
ALTER TABLE "new_Task" RENAME TO "Task";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
