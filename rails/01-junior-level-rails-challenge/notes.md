Optionally, leave any notes here about your design and implementation.

Wasn't sure how to do "If the export succeeded, failed, or if it is still running" properly
I cobbled something together but I find it highly likely that my implementation was incorrectly done

Also not sure if I got export starting and ending time done correctly. However, there is a gap in time
which is what I would expect given a CSV file of the size found in /seeds/seed_files. If I had more time I would
have verified this by adding at least several hundred more seeds to patients in order to verify





<!-- TODO LIST -->
<!-- All of our customers have patients, and all of our partners are made up of one or many customers. -->

<!-- allow create, update, and read operations on partners and customers.  -->
<!-- The patient records should not have any write operations from the web application (patient data is provided in a seed file), and when viewed they should be scoped on a partner or customer. -->

<!-- Additionally, the patient records should be exportable (as a CSV) a record should be kept of those exports, including this information:
- When the export started, ended, and its duration
- If the export succeeded, failed, or if it is still running
- The number of lines/records in the export -->

<!-- The data tracked for the exports (listed above) should be viewable in the web application as well. -->

<!-- ## Details -->
<!-- - A partner has a name and location and many customers -->
<!-- - A customer has a name and a location and many patients -->
<!-- - An export should have a start time, end time, duration, status, and the associated customer or partner (that the export was created for) -->

<!-- The CSV data for patients includes a `customer_external_id` field. Use this to map/associate patient records to a customer record (which is NOT provided in the seed file - create those on your own and add to the `db:seed` process). -->

<!-- ## Challenge -->
<!-- 1. Update the existing rails web application (in `patient-app` subdirectory) that meets the requirements listed above -->
<!-- 1. Create at least one model test and at least one request test in RSpec for the application -->
<!-- 1. Write code that executes with `rails db:seed` that will enable someone to test your application without needing to create additional data for partners, customers, or patients -->
<!-- 1. Optionally, leave notes and feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include a commit message as if this was production code -->
