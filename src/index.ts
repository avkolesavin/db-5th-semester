import { AppDataSource } from './data-source';

import { seed } from './seed';

(async () => {
    try {
        const ds = await AppDataSource.initialize();

        try {
            await seed(ds);
        } catch (err) {
            console.error(err);
        } finally {
            ds.destroy();
        }
    } catch (err) {
        console.error(err);
    }
})();
