#include "pulse.h"

int main(int , char *[])
{
    PulseClient client("patoggler");
    client.Populate();
    const Sink *device = client.GetDefaultSink();
    if (!device) {
        puts("couldn't find default sink");
        return 1;
    }
    client.setMute(device, !device->Muted());

    return 0;
}
