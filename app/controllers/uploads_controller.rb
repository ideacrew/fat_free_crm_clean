class UploadsController < ApplicationController

  def upload_lead
    if upload_file_type.include?(file_content_type)
      params.permit!
      result = Crm::Leads::UploadLeads.new.call(params.to_h)
      if result.success?
        flash[:notice] = 'Successfully uploaded Leads'
      else
        flash[:error] = format_error_message(result.failure.flat_map(&:messages))
      end
    else
      flash[:error] = 'Please upload Excel/CSV format files only'
    end
    redirect_to leads_path
  end

  def upload_contact
    if upload_file_type.include?(file_content_type)
      params.permit!
      result = Crm::Contacts::UploadContacts.new.call(params.to_h)

      if result.success?
        flash[:notice] = 'Successfully uploaded Contacts'
      else
        flash[:error] = format_error_message(result.failure.flat_map(&:messages))
      end
    else
      flash[:error] = 'Please upload Excel/CSV format files only'
    end

    redirect_to contacts_path
  end

  def upload_opportunity
    #todo upload
    redirect_to opportunities_path
  end

  def upload_campaign
    #todo upload
    redirect_to campaigns_path
  end

  def upload_account
    #todo upload
    redirect_to accounts_path
  end

  def file_content_type
    params[:file].first.content_type if params[:file]
  end

  def upload_file_type
    [
      'text/csv',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/vnd.ms-excel',
      'application/xls',
      'application/xlsx'
    ].freeze
  end

  private

  def format_error_message(messages)
    path = messages.flat_map(&:path)
    text = messages.flat_map(&:text)
    error = {}
    path.zip(text) { |a,b| error[a] = b }

    error
  end

end
