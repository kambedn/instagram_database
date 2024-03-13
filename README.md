# Instagram Database (MySQL)
For this project, a simplified version of the Instagram database was developed, incorporating crucial features including user management, photo sharing, comments, followers/following relationships, likes, and tagging functionalities. The database schema was  designed to ensure efficient storage and management of user-generated content, interactions, and relationships. Additionally, a substantial amount of example data has been inserted into the database, facilitating thorough testing and demonstration of its functionalities and capabilities. This comprehensive dataset enriches the development process by providing realistic scenarios and use cases for evaluating the system's performance and usability.

Additionally, within the project files, there exists a document named "instagram_questions," housing seven queries formulated to tackle real-world issues pertinent to the stored data. These queries are designed to address various scenarios and challenges that may arise during the operation of the Instagram-like platform, providing practical solutions and insights into data manipulation and retrieval.

## Database Schema (instagram_database_schema.sql):

![image](https://github.com/kambedn/instagram_database/assets/117531956/d9e7e744-8e96-4a98-9f64-c6b2be1dd3e2)


### 1. Users Table (users):
- Contains information about users such as their unique ID, username, and the timestamp of when they were created.
- The id field serves as the primary key, auto-incremented for each new user.
- The username field is set to be unique and not null, ensuring that each username is distinct.
- created_at records the timestamp when the user was created.

### 2 .Photos Table (photos):
- Stores details about uploaded photos, including the image URL, user ID of the uploader, and the timestamp of when the photo was created.
- The id field serves as the primary key, auto-incremented for each new photo.
- The user_id field establishes a foreign key relationship with the id field in the users table, linking each photo to its uploader.
- created_at records the timestamp when the photo was uploaded.
  
### 3. Comments Table (comments):
- Stores comments made by users on photos.
- Contains the comment ID, the text of the comment, the user ID of the commenter, the photo ID of the commented photo, and the timestamp of when the comment was created.
- Both user_id and photo_id fields establish foreign key relationships with their respective tables (users and photos).
- created_at records the timestamp when the comment was made.
  
### 4. Likes Table (likes):
- Records instances where users like specific photos.
- The primary key is composed of user_id and photo_id, ensuring that each user can like a photo only once.
- Foreign key constraints are set on both user_id and photo_id fields, referencing the users and photos tables, respectively.
- created_at records the timestamp when the like was made.
  
### 5. Followers Table (follows):
- Manages the follower-followee relationships between users.
- The primary key is composed of follower_id and followee_id, preventing duplicate entries.
- Both follower_id and followee_id fields establish foreign key relationships with the id field in the users table.
- The same_person_follow constraint ensures that a user cannot follow themselves.
- created_at records the timestamp when the follow relationship was established.
  
### 6. Tags Table (tags):
- Stores unique tags that can be associated with photos.
- Contains the tag ID, the tag name, and the timestamp of when the tag was created.
- The tag_name field is set to be unique.
- created_at records the timestamp when the tag was created.

### 7. Photo_tags Table (photo_tags):
- Establishes connections between photos and tags, allowing photos to be associated with multiple tags.
- The primary key is composed of photo_id and tag_id.
- Foreign key constraints link photo_id to the id field in the photos table and tag_id to the id field in the tags table.

### 8. Unfollows Table (unfollows):
- Logs instances where users unfollow each other.
- Records the follower_id and followee_id of the unfollowed relationship, along with the timestamp when the unfollow occurred.
- Primary key is composed of follower_id and followee_id.

## Triggers:

### 1. Anti Self-Follow Trigger:
- Prevents users from following themselves by raising an error when an attempt is made to create a follow relationship where the follower and followee are the same.
- Implemented using a BEFORE INSERT trigger on the follows table.
  
### 2. Capture Unfollow Trigger:
- Logs unfollow events into the unfollows table when a follow relationship is deleted.
- Inserts records into the unfollows table after a deletion occurs on the follows table.
- Implemented using an AFTER DELETE trigger on the follows table.
  
