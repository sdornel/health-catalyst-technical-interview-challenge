class Export < ApplicationRecord
    # belongs_to :patient

    def export_duration
        byebug
    end

    def change_export_status

    end

    def create_export
        byebug
    end

end






# Additionally, the patient records should be exportable (as a CSV) a record should be kept of those exports, including this information:
# - When the export started, ended, and its duration
# - If the export succeeded, failed, or if it is still running
# - The number of lines/records in the export
