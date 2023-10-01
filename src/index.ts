import { AppDataSource } from './data-source';
import { Tourist } from './entity';
import { ToursLog } from './entity/tours-log';

(async () => {
    try {
        const ds = await AppDataSource.initialize();
        const rep = ds.getRepository(ToursLog);

        try {
            const data = await rep.find();
            console.log('data: ', JSON.stringify(data));
        } catch (err) {
            console.error(err);
        } finally {
            ds.destroy();
        }
    } catch (err) {
        console.error(err);
    }
})();
