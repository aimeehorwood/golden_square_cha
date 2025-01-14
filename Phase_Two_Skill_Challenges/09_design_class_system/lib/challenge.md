{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


VERBS: (METHODS?)
RECORD
REFLECT
READ
SELECT
KEEP
KEEP TRACK
SEE 

NOUNS: (CLASS?)
DIARY
EXPERIENCES
TIME
READING SPEED
TASKS
TODO LIST
CONTACTS
LIST 
PHONE NUMBERS


2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail.

class Diary
def add(entry) # entry is an instance of DiaryEntry
end

 def entries 
# returns a list of DiaryEntries
end
end

class DiaryEntry
def initialize(title,contents) # title and contents are both strings
end 

 def title 
# returns title as a string
end 

 def contents 
# returns contents as a string
end 
end 

 class PhoneNumberCrawler
def initialize(diary) #diary is an instance of Diary
end

 def extract_numbers
# returns a list of strings representing phone numbers
# gathered across all diary entries
end
end

class DiaryReader
 def initialize (wpm, diary)
# wpm is a number representing how many words the reader can read
# in one minute
# diary is an instance of Diary
end 

 def find_most_readable_in_time(time)
 # returns an instance of DiaryEntry, corresponding to the entry with 
 # the longest contents that is still readable within the time, based on 
 # the wpm specified earlier
 end
 end

 class TaskList
  def add(task) #task is an instance of Task
 end

  def all 
    #returns a list of tasks
    end
  end

 class Task
 def initalize(title) #title is a String
 end

 def title
 # returns the title as a string
 end
 end


3. # Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.


## As a user
## So that I can record my experiences
## I want to keep a regular diary

## As a user
## So that I can reflect on my experiences
## I want to read my past diary entries


# 1 
diary = Diary.new
entry_1 = DiaryEntry.new("my title", "my contents")
entry_2 = DiaryEntry.new("my title two", "my contents two")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.entries).to eq [entry_1,entry_2]

----


##  As a user
##  So that I can reflect on my experiences in my busy day
##  I want to select diary entries to read based on how much time I have and my reading speed


# 2  - fits exactly 

diary = Diary.new
reader = DiaryReader.new(2,diary)
entry_1 = DiaryEntry.new("title1", "one")
entry_2 = DiaryEntry.new("title2", "one two")
entry_3 = DiaryEntry.new("title3", "one two three")
entry_4 = DiaryEntry.new("title4", "one two three four")
entry_5 = DiaryEntry.new("title5", "one two three four five")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.add(entry_5)
expect(reader.find_most_readable_in_time(2)) to eq entry_4


# 3 - does not fit exactly

diary = Diary.new
reader = DiaryReader.new(2,diary)
entry_1 = DiaryEntry.new("title1", "one")
entry_2 = DiaryEntry.new("title2", "one two")
entry_3 = DiaryEntry.new("title3", "one two three")
entry_4 = DiaryEntry.new("title5", "one two three four five")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
expect(reader.find_most_readable_in_time(2)) to eq entry_3

# 4 - nothing readable in the time 

diary = Diary.new
reader = DiaryReader.new(2,diary)
entry_1 = DiaryEntry.new("title1", "one two three four five")
diary.add(entry_1)
expect(reader.find_most_readable_in_time(2)) to eq nil


# 5 - nothing at all 

diary = Diary.new
reader = DiaryReader.new(2,diary)
expect(reader.find_most_readable_in_time(2)) to eq nil


# 6 - wpm invalid

diary = Diary.new
reader = DiaryReader.new(0,diary) #should fail with "WPM must be above 0"

------

## As a user
## So that I can keep track of my tasks
## I want to keep a todo list along with my diary

# 7  

task_list = TaskList.new
task_1 = Task.new("Walk the dog")
task_2 = Task.new("Feed the cat")
task_list.add(task_1)
task_list.add(task_2)
expect(task_list).to eq [task_1, task_2]

----

## As a user
## So that I can keep track of my contacts
## I want to see a list of all of the mobile phone numbers in all my diary entries

# 8 

diary = Diary.new
phone_book = PhoneNumberCrawler.new(diary)
diary.add(DiaryEntry.new("title, "my friend 0829289282 is cool"))
diary.add(DiaryEntry.new("title, "my friends 0829289282 , 0812345585, and 0812345584, 0812345584 are cool"))
expect(phone_book.extract_numbers).to eq [
    "0829289282"
    "0812345585"
    "0812345584"
]



4.  Create Examples as Unit Tests 


Do these as we go along! 

# Empty Diary  











5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.