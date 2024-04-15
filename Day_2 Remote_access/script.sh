#!bin/bash
sudo yum  update -y 
sudo yum install -y httpd 
sudo yum start httpd 

yum install docker -y
systemctl start docker 

cd /var/www/html 
vim index.html

# Define the content of the index.html file
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautiful Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; 
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #333; /* Dark gray text color */
            text-align: center;
        }

        .card {
            background-color: #fff; /* White card background */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
            padding: 20px;
            margin-bottom: 20px;
        }

        .card img {
            max-width: 100%;
            border-radius: 8px;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Welcome to Beautiful Website</h1>

        <div class="card">
            <h2>Card Title 1</h2>
            <p>This is a beautiful card with an image.</p>
            <img src="https://via.placeholder.com/400x200" alt="Card Image 1">
        </div>

        <div class="card">
            <h2>Card Title 2</h2>
            <p>This is another beautiful card with a different image.</p>
            <img src="https://via.placeholder.com/400x200" alt="Card Image 2">
        </div>
    </div>

</body>

</html>

EOF

echo "index.html file created successfully!"
sudo systemctl start httpd 
sudo systemctl enable httpd 





