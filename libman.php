<html>
    <body>
    <style>
        body {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            background-image: url('images/library-book-bookshelf-read.jpg');
            background-size: cover;
            background-position: center;
            padding: 20px;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin:auto;
            text-align: left;
        }

        h1 {
            text-align: center;
            color: grey;
        }

        label, p {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 7px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .submitter, .reseter {
            background-color: rgb(65, 163, 238);
            color: white;
            padding: 10px 15px;
            margin: 10px 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submitter:hover, .reseter:hover {
            background-color: darkblue;
        }
    </style>
        
    <h1>LIBRARY MANAGEMENT SYSTEM</h1>
    <form action="libman.php" method="post">
        <label for="title">Enter book title:  </label>
        <input type="text" id="title" required placeholder="Romeo Juliet" name="title"><br>
        
        <label for="author">Enter book's author:  </label>
        <input type="text" id="author" required placeholder="Shakespeare" name="author"><br>

        <label for="genre">Enter book's genre: </label>
        <input type="text" id="genre" required placeholder="Romance" name="genre"><br>

        <button type="reset" class="reseter">Reset</button>
        <button type="submit" class="submitter" name="submit">Submit</button>
    </form>

    <?php
    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'lib_manager');

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insert new book
    if(isset($_POST['submit'])){
        $title = $_POST['title'];
        $author = $_POST['author'];
        $genre = $_POST['genre'];

        // Using prepared statements to avoid SQL injection
        $stmt = $conn->prepare("INSERT INTO Books (title, author, genre) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $title, $author, $genre);

        if ($stmt->execute()) {
            // Redirect after successful insertion
            header("Location: libman.php?success=1");
            exit();
        } else {
            echo "<p>Error: " . $stmt->error . "</p>";
        }

        $stmt->close();
    }

    // Display success message if redirected with success
    if (isset($_GET['success']) && $_GET['success'] == 1) {
        echo "<p>New book added successfully</p>";
    }

    $conn->close();
    ?>
    </body>
</html>
