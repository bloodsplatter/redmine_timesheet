module TimesheetHelper
  
  def first_day_in_week(datum)
    return unless datum.kind_of? Date
    
    datum - datum.wday
  end
  
  def last_day_in_week(datum)
    return unless datum.kind_of? Date
    
    datum + (6 - datum.wday)
  end
  
  def init_pdf
    pdf = FPDF.new
    pdf.SetCreator :creator => "Redmine Timesheet plugin"
    pdf.SetFont "Arial","B"
    pdf.SetAutoPageBreak true
    pdf.SetDrawColor 0
    pdf.SetTextColor 0
    pdf.SetLineWidth 0.25
    pdf.AddPage
  end
  
  def pdf_h2(pdf,content="h2")
    pdf.SetFontSize(16)
    
    pdf.SetFontSize(12)
  end
  
  def number_style
    "style='text-align:right;'"
  end
end
