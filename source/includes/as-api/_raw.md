<!--
place during daily operations which has relevance for the organization or its customers. A website login, complete purchase, new order or client expressing an interest in a product are all examples of such events.

Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.
-->

<!--
### Event-Entity Graph
Activity Stream's stores all events in its [Historical Store]() which is graph based.</br>
This enables a range of valuable services but it does introduce some requirements on the event-message structure.

### Message Aspects
[Aspects](#aspects) are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.

### Time-Series
Activity Stream includes a [real-time analytics store]() capable of storing multi-metric, multi-dimensional time-series.
</br> There new data points are immediately available for [ad-hoc querying]().
</br>Think of the AS analytics store as an dynamic OLAP/Cube which is continuously updated and can be sliced and diced at will.
</br>Analytic information for submitted event-messages are immediately available and messages containing purchase information, page-views and ab-testing information are represented in purpose build analytic models.
</br>You can submit any data-points to the analytics which creates new time-series on demand.

### Observations
[Observations]() are activity-stream-items created by the [Observation Engine]() when it detects situations, threats or opportunities which it has been trained to identify.
</br>These observations become a part of the activity stream for the entities it involves and it's sent to users and systems that have expressed interest in them or the entities involved.
</br>This is the preferred way to deliver actionable intelligence to users but observations are sent directly to systems, via message queue, as well.

### Notifications
Any User, with sufficient privileges, can [subscribe to events or observations]() of certain types or concerning certain entities and receive notifications when applicable.

### Stream_ID
Every peace of data belonging to the activity stream has a stream_id.
</br>This applies to events, entities, comments, bumps, subscriptions and more.
</br>To improve tracking and consistency the Stream IDs are calculated using [deterministic UUIDs]() (named) that can be pre-calculated for any object, even before sending it to Activity Stream.

### Streaming Analytics
Every message received by Activity Stream is processed and analysed.
</br>That process yields a lot af statistical information which is published, via a web-socket and message queue, at fixed intervals.
</br>This, along with streaming-events, can be used to build dashboards that are continuously updated and more.
-->


###Contextual awareness powered by the Event-Entity Graph
The event-entity graph works best if we also understand who/what is involved in each event. The event-entity graph allows us to analyze event patterns, not only based on frequency or type, but with advanced pattern detection that spans both time and connected entities in the graph.
That way the contextual aspect is improved considerably as well as the temporal.

###Access Control
Access to the events can be controlled in various ways so that events in the stream can be visible to all employees, a group of employees, management, internal auditing or they can even be viewable by the customer on your self-service portal. See the ACL property for further information.

###Collaboration and communications with comments (integrated discussion threads)
Each event in the event stream is a discussion point and the Activity Stream commenting system facilitates such activity. Important events, regardless of what they concern, can be conversations starters just as an Facebook entry can spark conversation amongst friends. If the activity stream is available on the self-service portal it can even extend out to the customer as well without the risk of internal discussions becoming public.


###Shows analytic entries generated for the event [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`/analytics

###List of events attached to a single entity (See stream API) [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`/events?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`

###List of Comments attached to the event [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`/comments?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`

###List of Bumps attached to the event [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`/bumps?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`

###Single Event by an external id specified in the "identifiable" aspect [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/external-id/`{external-id}`

###All Events by an external batch-id specified in the "identifiable" aspect [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/external-batch-id/`{batch-id}`

###Event examples
A website login, purchase being made, new order created or client expressing an interest in a product are all examples of events.
Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

###Aspects
</br></br>You can mix and match aspects to trigger the desired functionality for any custom event as well as events from the Activity Stream Event Library.
</br></br>Event message can include multiple aspects or none at all but it’s good to keep in mind that a clear sign of bloated event messages is if the aspect do not seem to fit together or it’s unclear what aspects affect in the message. In other words; it’s sometimes better to send more messages than cram everything into one.

<!--
traction* | Long | For how long does this affect the entity (in minutes) (See duration serialization).</br>* Defaults to 14 days
points | Float | Points being scored
-->
