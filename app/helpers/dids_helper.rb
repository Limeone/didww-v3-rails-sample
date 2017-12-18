module DidsHelper
  def did_status(did)
    status = []
    status << 'Awaiting registration' if did.awaiting_registration
    status << 'Blocked' if did.blocked
    status << 'Terminated' if did.terminated
    status << 'Pending removal' if did.pending_removal
    status.join(', ')
  end
end
