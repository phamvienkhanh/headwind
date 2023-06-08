import QtQuick

Item {
    id: root

    property color color : "black"
    property list<int> radius : [0,0,0,0]

    Canvas {
        id: canvas
        anchors.fill: parent
        smooth: true
        antialiasing: true
        onPaint: {
            var ctx = getContext("2d");
            var x = 0;
            var y = 0;
            var w = root.width;
            var h = root.height;
            ctx.setTransform(1, 0, 0, 1, 0, 0);
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.save();

            ctx.beginPath();
            ctx.moveTo(x + root.radius[0], y);
            ctx.lineTo(x + w - root.radius[1], y);
            ctx.arcTo(x + w, y, x + w, y + root.radius[1], root.radius[1]);
            ctx.lineTo(x + w, y + h - root.radius[2]);
            ctx.arcTo(x + w, y + h, x + w - root.radius[2], y + h, root.radius[2]);
            ctx.lineTo(x + root.radius[3], y + h);
            ctx.arcTo(x, y + h, x, y + h - root.radius[3], root.radius[3]);
            ctx.lineTo(x, y + root.radius[0]);
            ctx.arcTo(x, y, x + root.radius[0], y, root.radius[0]);
            ctx.closePath();

            ctx.fillStyle = root.color;
            ctx.fill();

            ctx.lineWidth = 1;
            ctx.strokeStyle = "red";
            ctx.stroke();


            ctx.restore();
        }
    }
}
