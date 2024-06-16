-- אילוץ CHECK לוודא שהמחיר בקורס הוא לפחות 0 בטבלת Courses
ALTER TABLE Courses
ADD CONSTRAINT check_course_price CHECK (price >= 0);

-- אילוץ DEFAULT למיקום בטבלת Rooms
ALTER TABLE Rooms
MODIFY r_location DEFAULT 'Unknown';

-- אילוץ CHECK לוודא שמספר הטלפון כולל בדיוק 9 ספרות בטבלת Kids
ALTER TABLE Kids
ADD CONSTRAINT check_kid_phone CHECK (LENGTH(phone) = 9);


