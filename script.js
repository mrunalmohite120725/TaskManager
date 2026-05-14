function quickReply(text)
{
    document.getElementById("userInput").value = text;

    sendMessage();
}

function sendMessage()
{
    let input =
    document.getElementById("userInput").value;

    let msg = input.toLowerCase();

    let chat =
    document.getElementById("chat");

    chat.innerHTML +=
    "<b>You:</b> " + input + "<br>";

    let reply = "";

    // Rule Based Chatbot

    if(msg.includes("hello") || msg.includes("hi"))
    {
        reply =
        "Hello! Welcome to Travel Agency";
    }

    else if(msg.includes("tour"))
    {
        reply =
        "Available Tours:<br>" +
        "1. Goa Tour<br>" +
        "2. Kashmir Tour<br>" +
        "3. Manali Tour<br>" +
        "4. Kerala Tour";
    }

    else if(msg.includes("goa"))
    {
        reply =
        "Goa package costs Rs.15000 for 4 days";
    }

    else if(msg.includes("kashmir"))
    {
        reply =
        "Kashmir package costs Rs.25000 for 6 days";
    }

    else if(msg.includes("manali"))
    {
        reply =
        "Manali package costs Rs.18000";
    }

    else if(msg.includes("kerala"))
    {
        reply =
        "Kerala package costs Rs.22000";
    }

    else if(msg.includes("booking"))
    {
        reply =
        "Booking can be done online or at office";
    }

    else if(msg.includes("hotel"))
    {
        reply =
        "3-star and 5-star hotels are available";
    }

    else if(msg.includes("food"))
    {
        reply =
        "Breakfast and dinner are included";
    }

    else if(msg.includes("bus"))
    {
        reply =
        "AC bus facility is available";
    }

    else if(msg.includes("train"))
    {
        reply =
        "Train booking assistance is available";
    }

    else if(msg.includes("flight"))
    {
        reply =
        "Flight tickets are available";
    }

    else if(msg.includes("price"))
    {
        reply =
        "Tour packages start from Rs.5000";
    }

    else if(msg.includes("discount"))
    {
        reply =
        "10% discount available for students";
    }

    else if(msg.includes("family"))
    {
        reply =
        "Special family packages are available";
    }

    else if(msg.includes("honeymoon"))
    {
        reply =
        "Honeymoon packages available for Goa and Kashmir";
    }

    else if(msg.includes("adventure"))
    {
        reply =
        "Adventure activities include trekking and rafting";
    }

    else if(msg.includes("contact"))
    {
        reply =
        "Phone: 9876543210<br>" +
        "Email: travelagency@gmail.com<br>" +
        "Address: FC Road, Pune";
    }

    else if(msg.includes("payment"))
    {
        reply =
        "UPI, Card and Cash payments accepted";
    }

    else if(msg.includes("timing"))
    {
        reply =
        "Office timing is 9 AM to 6 PM";
    }

    else if(msg.includes("bye"))
    {
        reply =
        "Thank You! Have a safe journey";
    }

    else
    {
        reply =
        "Sorry! I don't understand";
    }

    chat.innerHTML +=
    "<b>Bot:</b> " + reply + "<br><br>";

    document.getElementById("userInput").value = "";

    chat.scrollTop = chat.scrollHeight;
}