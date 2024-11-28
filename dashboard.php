<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['recipients'])) {
    $recipients = $_POST['recipients'];
    $message = $_POST['message'];

    // Split recipients by comma
    $recipient_list = explode(',', $recipients);
    
    foreach ($recipient_list as $recipient) {
        $recipient = trim($recipient); // Clean whitespace
        
        // Check if the recipient is an email or phone number
        if (filter_var($recipient, FILTER_VALIDATE_EMAIL)) {
            $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
        } else {
            $stmt = $pdo->prepare("SELECT id FROM users WHERE phone = ?");
        }
        
        $stmt->execute([$recipient]);
        
        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch();
            $recipient_id = $row['id'];

            // Insert the new message into the database
            $insert_stmt = $pdo->prepare("INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)");
            $insert_stmt->execute([$user_id, $recipient_id, $message]);
        }
    }
    $success = "Message sent to all recipients!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .suggestions {
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            position: absolute;
            background: white;
            z-index: 1000;
        }
        .suggestions div {
            padding: 10px;
            cursor: pointer;
        }
        .suggestions div:hover {
            background: #f0f0f0;
        }
        .error {
            color: red;
            display: none; /* Hidden by default */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Send Message</h2>

        <form method="POST">
            <label>
                <input type="radio" name="messageType" value="email" checked> Email
            </label>
            <label>
                <input type="radio" name="messageType" value="sms"> SMS
            </label>
            <br><br>
            <input type="text" id="recipientInput" name="recipients" placeholder="Enter recipient (comma-separated)" required autocomplete="off">
            <div class="error" id="error-message">Invalid input: please enter a valid phone number or email.</div>
            <div id="suggestions" class="suggestions" style="display: none;"></div>
            <textarea name="message" placeholder="Type your message here..." required></textarea>
            <button type="submit">Send</button>
        </form>
        <?php if (isset($success)): ?>
            <p class="success"><?php echo $success; ?></p>
        <?php endif; ?>

        <a href="logout.php">Logout</a>
    </div>

    <script>
        $(document).ready(function() {
            let inputTimeout;

            $('#recipientInput').on('input', function() {
                clearTimeout(inputTimeout);
                let inputVal = $(this).val();
                let lastEntry = inputVal.split(',').pop().trim(); // Get the last entry

                // Determine the selected message type
                const messageType = $('input[name="messageType"]:checked').val();
                let isValid = true; // Assume valid until proven otherwise

                // Validate based on the selected type
                if (lastEntry.length > 0) {
                    if (messageType === 'sms') {
                        // Validate for phone number (only digits)
                        isValid = /^\d+$/.test(lastEntry);
                    } else {
                        // Validate for email format
                        // isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(lastEntry);
                    }

                    // Show or hide the error message based on validation
                    if (!isValid) {
                        $('#error-message').show();
                    } else {
                        $('#error-message').hide();
                    }

                    // Fetch suggestions if input is valid
                    if (isValid) {
                        inputTimeout = setTimeout(function() {
                            $.ajax({
                                url: 'fetch_suggestions.php',
                                method: 'POST',
                                data: {query: lastEntry, type: messageType},
                                success: function(data) {
                                    $('#suggestions').html(data).show();
                                }
                            });
                        }, 300); // Delay to wait for user to finish typing
                    } else {
                        $('#suggestions').hide();
                    }
                } else {
                    // Hide suggestions and error message if input is empty
                    $('#suggestions').hide();
                    $('#error-message').hide();
                }
            });

            $(document).on('click', '.suggestion-item', function() {
                let currentInput = $('#recipientInput').val();
                let newInput = $(this).text();
                
                // Replace the last entry with the selected suggestion
                let entries = currentInput.split(',');
                entries[entries.length - 1] = newInput; // Replace last entry
                $('#recipientInput').val(entries.join(', '));
                $('#suggestions').hide();
            });

            $(document).click(function(e) {
                if (!$(e.target).closest('#recipientInput').length) {
                    $('#suggestions').hide();
                }
            });
        });
    </script>
</body>
</html>