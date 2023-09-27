import { AppDataSource } from './data-source';
import { Tourist } from './entity';

AppDataSource.initialize()
    .then(async ds => {
        const rep = ds.getRepository(Tourist);
        const tourist = await rep.find({ where: { id: 2 } });
        console.log('tourist: ', tourist);

        ds.destroy();
    })
    .catch(error => console.log(error));
