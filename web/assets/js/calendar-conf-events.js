var Script = function () {


    /* initialize the external events
     -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };
        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
     -----------------------------------------------------------------*/

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        }, monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        today: ["今天"],
        firstDay: 1,
        buttonText: {
            today: '今天',
            month: '月',
            week: '周',
            day: '日'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function(date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }

        },
        events: function() {
            $("#calendar").fullCalendar('removeEvents');
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath }/userCalendar",
                success: function (data){
                    var origin = data.split("<id>");
                    for(var i=1;i<origin.length;i++)
                    {
                        var first = origin[i].split("<title>");
                        var id = first[0];
                        var second = first[1].split("<start>");
                        var title = second[0];
                        var third = second[1].split("<end>");
                        var start = new Date(Date.parse(third[0].replace(/-/g, "/")));
                        var end = new Date(Date.parse(third[1].replace(/-/g, "/")));
                        var obj = new Object();
                        obj.id = id;
                        obj.title = title;
                        obj.start = start;
                        obj.end = end;
                        switch (i%4)
                        {
                            case 0:
                                obj.color = '#d9534f';
                                break;
                            case 1:
                                obj.color = '#777';
                                break;
                            case 2:
                                obj.color = '#5bc0de';
                                break;
                            case 3:
                                obj.color = '#5cb85c';
                                break;
                        }
                        obj.borderColor = '#fff';
                        $("#calendar").fullCalendar('renderEvent',obj,true);
                    }
                },
                error:function (){
                    alert("服务器异常，请联系管理员！");
                }
            });
        },
        eventClick: function (calEvent,jsEvent,view) {
            $('#agenda'+calEvent.id).modal('show');
        }
    });


}();