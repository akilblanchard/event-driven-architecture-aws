def handler(event, context):
    #logs the event object as a string
    print(f'EVENT {str(event)}')
    return {"success": True}